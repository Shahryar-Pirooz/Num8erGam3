import { createContext, Dispatch, SetStateAction } from 'react'

interface ILevelCtx {
	LevelCtx: number
	SetLevelCtx: Dispatch<SetStateAction<number>>
}

export const LevelCtx = createContext<ILevelCtx>({
	LevelCtx: 0,
	SetLevelCtx: () => {},
})
