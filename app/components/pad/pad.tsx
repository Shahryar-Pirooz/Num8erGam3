import Btn from './btn'

interface Props {
	size: number
	numbers: number[]
}

export default function Pad({ numbers, size }: Props) {
	const answer = Array.from(numbers).sort((a, b) => a - b)
	const clickHandlers = (e: React.MouseEvent<HTMLDivElement>) => {
		if (answer[0].toString() === e.currentTarget.id) {
			e.currentTarget.classList.add('bg-foreground', 'text-background')
			answer.shift()
		}
	}
	return (
		<div
			className='grid gap-2'
			style={{ gridTemplateColumns: `repeat(${size} , 1fr)` }}
		>
			{numbers.map((n, i) => {
				return (
					<Btn
						key={i}
						text={`${n}`}
						callback={clickHandlers}
					/>
				)
			})}
		</div>
	)
}
