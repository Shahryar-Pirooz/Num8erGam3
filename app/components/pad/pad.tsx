import Btn from './btn'

interface Props {
	size: number
	numbers: number[]
}

export default function Pad({ numbers, size }: Props) {
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
						callback={() => {}}
					/>
				)
			})}
		</div>
	)
}
