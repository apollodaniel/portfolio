import { useEffect, useLayoutEffect, useRef, useState } from 'react';
import '../style/presentation.css';
import { Chip } from '@nextui-org/chip';

function PresentationSection() {
	const [width, setWidth] = useState(window.innerWidth);

	useLayoutEffect(() => {
		window.addEventListener('resize', () => {
			setWidth(window.innerWidth);
		});
	}, []);

	const text = 'Olá! 👋';
	const spansRef = useRef<Element[]>([]);

	useEffect(() => {
		spansRef.current.forEach((span, index) => {
			setTimeout(
				() => {
					span.classList.add('wavy');
				},
				index < text.length
					? index * 100
					: index % 2 === 0
						? 200
						: index % 3 === 0
							? 400
							: 0,
			);
		});
	}, []);

	return (
		<main>
			<div>
				<h2 className="highlight">
					{text.split('').map((letter, index) => (
						<span
							key={index}
							ref={(el) => (spansRef!.current[index] = el!)}
						>
							{letter}
						</span>
					))}
				</h2>{' '}
				<h2>
					<span className="emoji">👨‍💻</span> Meu nome é
				</h2>
				<h1 className="sm:leading-[128px] max-sm:leading-[96px]">
					{'Apollo Daniel'.split('').map((letter, index) => (
						<span
							key={index}
							ref={(el) =>
								(spansRef!.current[
									spansRef.current.length + index
								] = el!)
							}
						>
							{letter}
						</span>
					))}
				</h1>
			</div>

			<p>Sou um desenvolvedor backend/fullstack com expêriencia em</p>

			<div id="skills">
				<Chip size={width > 650 ? 'lg' : width > 450 ? 'md' : 'sm'}>
					Typescript
				</Chip>
				<Chip size={width > 650 ? 'lg' : width > 450 ? 'md' : 'sm'}>
					Postgresql
				</Chip>
				<Chip size={width > 650 ? 'lg' : width > 450 ? 'md' : 'sm'}>
					Rust
				</Chip>
				<Chip size={width > 650 ? 'lg' : width > 450 ? 'md' : 'sm'}>
					React
				</Chip>
				<Chip size={width > 650 ? 'lg' : width > 450 ? 'md' : 'sm'}>
					Docker
				</Chip>
			</div>
		</main>
	);
}

export default PresentationSection;
