import { MutableRefObject, useEffect, useRef, useState } from 'react';
import AboutMeSection from './components/about_me';
import PresentationSection from './components/presentation';
import { Button } from '@nextui-org/react';
import { Outlet, useLocation } from 'react-router-dom';
import { div } from 'framer-motion/client';

function App() {
	const [showGoTop, setShowGoTop] = useState(false);

	const presentationSectionRef = useRef<HTMLElement>();
	const aboutMeSectionRef = useRef<HTMLElement>();
	const projectsSectionRef = useRef();

	const navigateScroll = useRef((path: string) => {
		switch (path) {
			case '/about-me':
				console.log(window.location.pathname);
				aboutMeSectionRef.current?.scrollIntoView({
					behavior: 'smooth',
				});
				break;
			default:
				presentationSectionRef.current?.scrollIntoView({
					behavior: 'smooth',
				});
				break;
		}
	});

	useEffect(() => {
		document.body.addEventListener('scroll', (event) => {
			setShowGoTop(
				(event.currentTarget as Element).scrollTop >=
					(window.innerHeight / 3) * 2,
			);
		});
		navigateScroll.current(window.location.pathname);
	}, []);

	return (
		<>
			{/*
				 (<PresentationSection/>)


				*/}

			{location.pathname === '/projects/all' ? (
				<Outlet />
			) : (
				<>
					<PresentationSection
						ref={
							presentationSectionRef as MutableRefObject<HTMLElement>
						}
					/>
					<AboutMeSection
						ref={aboutMeSectionRef as MutableRefObject<HTMLElement>}
					/>
				</>
			)}

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
