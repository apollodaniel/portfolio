import { MutableRefObject } from 'react';

interface Props {
	ref: MutableRefObject<HTMLElement>;
}

export default function AboutMeSection({ ref }: Props) {
	return <main ref={ref}></main>;
}
