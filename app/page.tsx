import Logo from './components/logo/logo'
import Pad from './components/pad/pad'

export default function Home() {
	return (
		<div className='h-screen w-screen bg-background justify-center items-center mx-auto flex flex-col space-y-10'>
			<Logo />
			<Pad
				numbers={[1, 2, 3, 4, 5, 6, 7, 8, 9]}
				size={3}
			/>
		</div>
	)
}
