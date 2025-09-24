import type { Metadata } from 'next'
import { Barriecito } from 'next/font/google'
import './globals.css'

const barriecito = Barriecito({
	variable: '--font-barriecito',
	subsets: ['latin'],
	weight: '400',
})

export const metadata: Metadata = {
	title: 'Num8erGam3',
	description: 'a Gam3 with Num8ers',
}

export default function RootLayout({
	children,
}: Readonly<{
	children: React.ReactNode
}>) {
	return (
		<html lang='en'>
			<body
				className={` ${barriecito.variable} antialiased h-full w-full container mx-auto`}
			>
				{children}
			</body>
		</html>
	)
}
