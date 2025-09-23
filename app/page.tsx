'use client'

import { useState } from 'react'
import Game from './components/game/game'
import { LevelCtx } from './utils/context'
import Setting from './components/setting/setting'

export default function Home() {
	const [size, setSize] = useState(3)
	const [isGame, setIsGame] = useState(false)

	const gameHandler = () => {
		setIsGame(!isGame)
	}

	return (
		<LevelCtx value={{ LevelCtx: size, SetLevelCtx: setSize }}>
			{isGame ? <Game /> : <Setting callback={gameHandler} />}
		</LevelCtx>
	)
}
