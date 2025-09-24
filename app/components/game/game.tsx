'use client'

import Logo from '../logo/logo'
import Pad from '../pad/pad'
import { useContext } from 'react'
import { LevelCtx } from '@/app/utils/context'

const randomGenerator = (max: number) => {
	return Math.floor(Math.random() * max)
}

export default function Game() {
	const { LevelCtx: size } = useContext(LevelCtx)
	const n = randomGenerator(100)

	const list = Array.from({ length: 9 }, (_, i) => {
		return n + i
	})

	for (let i = list.length - 1; i > 0; i--) {
		const j = randomGenerator(i + 1)
		;[list[i], list[j]] = [list[j], list[i]]
	}

	return (
		<div className='flex size-full h-screen  bg-background justify-center items-center mx-auto flex-col space-y-10'>
			<Logo />
			<Pad
				numbers={list}
				size={size}
			/>
		</div>
	)
}
