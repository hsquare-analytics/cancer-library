import type {FC} from 'react'
import React, {memo, useCallback, useEffect, useState} from "react";
import update from 'immutability-helper'
import {useDrop} from 'react-dnd'

import {DndCard} from './dnd-card'
import {DndItemTypes} from './dnd-item-types'

const style = {
  width: 400,
}

interface IDndContainerProps {
  dataSource: any[]
}


export const DndContainer: FC<IDndContainerProps> = memo(function Container({ dataSource }) {
  const [cards, setCards] = useState([]);

  useEffect(() => {
    setCards(dataSource)
  }, [dataSource]);

  const findCard = useCallback(
    (id: string) => {
      const card = cards.filter((c) => `${c.id}` === id)[0] as {
        id: number
        text: string
      }
      return {
        card,
        index: cards.indexOf(card),
      }
    },
    [cards],
  )

  const moveCard = useCallback(
    (id: string, atIndex: number) => {
      const { card, index } = findCard(id)
      setCards(
        update(cards, {
          $splice: [
            [index, 1],
            [atIndex, 0, card],
          ],
        }),
      )
    },
    [findCard, cards, setCards],
  )

  const [, drop] = useDrop(() => ({ accept: DndItemTypes.CARD }))
  return (
    <div ref={drop} style={style}>
      {cards.map((card) => (
        <DndCard
          key={card.id}
          id={`${card.id}`}
          text={card.text}
          moveCard={moveCard}
          findCard={findCard}
        />
      ))}
    </div>
  )
})
