import { MouseEventHandler } from 'react'

interface Props {
	text: string
	callback: MouseEventHandler | undefined
}

export default function Btn({ text, callback }: Props) {
	return (
		<div
			onClick={callback}
			className='p-5 min-h-8 min-w-8 font-bold text-lg cursor-pointer select-none border rounded-md shadow-2xl shadow-accent bg-background font-sans hover:scale-105 active:scale-95 transition-all'
		>
			{text}
		</div>
	)
}
