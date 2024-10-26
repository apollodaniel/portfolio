import { useEffect, useState } from 'react';
import AboutMeSection from './components/about_me';
import PresentationSection from './components/presentation';
import { Button } from '@nextui-org/react';

function App() {
	const [showGoTop, setShowGoTop] = useState(false);

	useEffect(() => {
		document.body.addEventListener('scroll', (event) => {
			setShowGoTop(
				(event.currentTarget as Element).scrollTop >=
					(window.innerHeight / 3) * 2,
			);
		});
	});
	return (
		<>
			{/*
				 (<PresentationSection/>)

			<PresentationSection />
			<AboutMeSection />
				*/}

			{showGoTop && (
				<Button
					color="default"
					size="sm"
					isIconOnly
					onClick={() => {
						document.body.scrollTo({ top: 0, behavior: 'smooth' });
					}}
					className="absolute right-16 md:size-[72px] max-md:size-[48px] max-md:bottom-4 max-md:right-4 bottom-16 rounded-full"
				>
					<img
						src="../../public/arrow_up.svg"
						className="aspect-square w-[32px] h-[32px]"
					/>
				</Button>
			)}
		</>
	);
}

export default App;
