import { MouseEventHandler } from 'react'

interface Props {
	text: string
	callback: MouseEventHandler | undefined
}

export default function Btn({ text, callback }: Props) {
	return (
		<div
			id={text}
			onClick={callback}
			className='p-5 min-h-8 min-w-8 font-bold text-lg cursor-pointer select-none border rounded-md shadow-2xl shadow-foreground bg-background font-sans hover:scale-115 active:scale-85 transition-all'
		>
			{text}
		</div>
	)
}
