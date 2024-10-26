import { Card, CardBody, Image } from '@nextui-org/react';
import '../style/aboutme.css';
import { forwardRef } from 'react';

type Props = {};

const AboutMeSection = forwardRef<HTMLElement, Props>((props, ref) => {
	return (
		<main ref={ref} className="max-lg:p-24 max-md:p-16 max-sm:p-8">
			<Card
				isBlurred
				className="border-none bg-background/60 dark:bg-default-100/50 lg:w-[900px] lg:aspect-1/2"
				shadow="sm"
			>
				<CardBody>
					<div className="flex flex-row items-center max-md:flex-col w-full max-h-full p-1">
						<div className="aspect-square max-lg:w-[200px] max-md:w-[50px] me-2 ">
							<Image
								alt="Apollo Daniel"
								height="100%"
								width="100%"
								shadow="md"
								src="https://avatars.githubusercontent.com/u/87376389"
							/>
						</div>
						<div className="flex flex-col gap-0 justify-items-start align-start h-full w-full p-1 lg:ps-5">
							<h2 className="font-semibold text-foreground/90 lg:text-[32px] max-lg:text-[24px] text-center max-sm:leading-5">
								Um pouco sobre mim 👨‍💻
							</h2>
							<p className="text-xl max-lg:text-small font-medium text-start mt-2">
								Sou Apollo Daniel, tenho 18 anos e sou{' '}
								<strong>Desenvolvedor Backend</strong> com
								experiência em desenvolvimento de aplicações{' '}
								<b>web</b> de <strong>pequeno</strong> e{' '}
								<strong>médio porte</strong>, além de
								desenvolvimento de aplicações <b>mobile</b> para
								android.
								<br />
								Como um dev curioso, estou sempre buscando me
								desafiar e aprender coisas novas.
							</p>
						</div>
					</div>
				</CardBody>
			</Card>
		</main>
	);
});

export default AboutMeSection;
