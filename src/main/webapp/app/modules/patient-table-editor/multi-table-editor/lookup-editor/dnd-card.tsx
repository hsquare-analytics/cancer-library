import type {CSSProperties, FC} from 'react'
import React, {memo} from 'react'
import Button from '@mui/material/Button';
import {useDrag, useDrop} from 'react-dnd'

import {DndItemTypes} from './dnd-item-types'
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';
import Swal from 'sweetalert2';
import {fireDeleteCardSwal} from "app/modules/patient-table-editor/multi-table-editor/lookup-editor/lookup-editor.swal";

const style: CSSProperties = {
  border: '1px dashed gray',
  padding: '1rem',
  marginBottom: '.5rem',
  backgroundColor: 'white',
  cursor: 'move',
  display: 'flex',
  justifyContent: 'space-between',
}

export interface ICard {
  id: any;
  text: any;
}

export interface CardProps {
  id: string;
  text: string;
  moveCard: (id: string, to: number) => void
  findCard: (id: string) => { index: number; }
  cards: ICard[]
  setCards: (cards: ICard[]) => void;
}

interface Item {
  id: string
  originalIndex: number
}

export const DndCard: FC<CardProps> = memo(function Card({id, text, moveCard, findCard, cards, setCards}) {
  const originalIndex = findCard(id).index
  const [{isDragging}, drag] = useDrag(
    () => ({
      type: DndItemTypes.CARD,
      item: {id, originalIndex},
      collect: (monitor) => ({
        isDragging: monitor.isDragging(),
      }),
      end(item, monitor) {
        const {id: droppedId} = item
        const didDrop = monitor.didDrop()
        if (!didDrop) {
          moveCard(droppedId, originalIndex)
        }
      },
    }),
    [id, originalIndex, moveCard],
  )

  const [, drop] = useDrop(
    () => ({
      accept: DndItemTypes.CARD,
      hover({id: draggedId}: Item) {
        if (draggedId !== id) {
          const {index: overIndex} = findCard(id)
          moveCard(draggedId, overIndex)
        }
      },
    }),
    [findCard, moveCard],
  )

  const opacity = isDragging ? 0 : 1;

  const onClickDeleteButton = () => {
    fireDeleteCardSwal().then((result) => {
      if (result.isConfirmed) {
        setCards(cards.filter((card) => card.id !== id));
        Swal.fire('Deleted!', 'Your file has been deleted.', 'success');
      }
    });
  };

  return (
    <div ref={(node) => drag(drop(node))} style={{...style, opacity}}>
      <div className="d-flex align-items-center">
        {text}
      </div>
      <Button variant="text" onClick={onClickDeleteButton}>
        <FontAwesomeIcon icon="trash"/>
      </Button>
    </div>
  )
});
