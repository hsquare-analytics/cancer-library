import type {CSSProperties, FC} from 'react'
import React, {memo} from 'react'
import Button from '@mui/material/Button';
import {useDrag, useDrop} from 'react-dnd'

import {DndItemTypes} from './dnd-item-types'
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome';

const style: CSSProperties = {
  border: '1px dashed gray',
  padding: '1rem',
  marginBottom: '.5rem',
  backgroundColor: 'white',
  cursor: 'move',
  display: 'flex',
  justifyContent: 'space-between',
}

export interface CardProps {
  id: string
  text: string
  moveCard: (id: string, to: number) => void
  findCard: (id: string) => { index: number }
}

interface Item {
  id: string
  originalIndex: number
}

export const DndCard: FC<CardProps> = memo(function Card({
                                                           id,
                                                           text,
                                                           moveCard,
                                                           findCard,
                                                         }) {
  const originalIndex = findCard(id).index
  const [{isDragging}, drag] = useDrag(
    () => ({
      type: DndItemTypes.CARD,
      item: {id, originalIndex},
      collect: (monitor) => ({
        isDragging: monitor.isDragging(),
      }),
      end: (item, monitor) => {
        const {id: droppedId, originalIndex} = item
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

  const opacity = isDragging ? 0 : 1
  return (
    <div ref={(node) => drag(drop(node))} style={{...style, opacity}}>
      <div className="d-flex align-items-center">
        {text}
      </div>
      <Button variant="text">
        <FontAwesomeIcon icon="trash" />
      </Button>
    </div>
  )
})
