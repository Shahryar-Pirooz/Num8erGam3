import { LevelCtx } from '@/app/utils/context'
import { useContext } from 'react'
import Btn from '../pad/btn'
import Logo from '../logo/logo'

interface Props {
	callback: () => void
}

export default function Setting({ callback }: Props) {
	const { SetLevelCtx: setSize } = useContext(LevelCtx)
	const sizeHandler = (s: number) => {
		setSize(s)
		callback()
	}
	return (
		<>
			<div className='flex flex-col size-full h-screen justify-center items-center space-y-4'>
				<Logo />
				<div className='flex flex-row gap-4'>
					<Btn
						text='3*3'
						callback={() => sizeHandler(3)}
					/>
					<Btn
						text='4*4'
						callback={() => sizeHandler(4)}
					/>
					<Btn
						text='5*5'
						callback={() => sizeHandler(5)}
					/>
				</div>
			</div>
		</>
	)
}
