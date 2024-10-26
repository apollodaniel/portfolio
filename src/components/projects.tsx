import { forwardRef, MutableRefObject, useEffect, useState } from 'react';
import { RepositoriesContext } from '../App';
import { Button, Card, CardBody, CardHeader, Image } from '@nextui-org/react';
import { get_youtube_embbed_url } from '../functions';

type Props = {};

const ProjectsSection = forwardRef<HTMLElement, Props>((props, ref) => {
	const [size, setSize] = useState<[number, number]>([
		window.innerWidth,
		window.innerHeight,
	]);

	useEffect(() => {
		window.addEventListener('resize', () => {
			setSize([window.innerWidth, window.innerHeight]);
		});
	}, []);

	return (
		<RepositoriesContext.Consumer
			children={(vl) => {
				return (
					<main ref={ref} className="h-[100vh] w-[100vw]">
						<Card
							isBlurred
							className=" border-[rgba(255,255,255,0.1)] border-[1px] bg-background/60 dark:bg-default-100/50"
							shadow="sm"
						>
							<CardHeader className=" flex-row max-md:flex-col justify-between items-center align-middle">
								<h2 className="text-center text-[32px] max-md:text-[24px] mt-[8px]  max-sm:text-[20px]">
									Meus projetos ✅
								</h2>
								<Button
									className="text-center flex flex-col items-center justify-center mt-[8px] h-[50px]"
									variant="light"
								>
									Ver todos os projetos
								</Button>
							</CardHeader>
							<CardBody className="flex-row flex-wrap items-center justify-center max-w-[80vw] gap-3">
								{!vl ? (
									<p className="font-small">
										⚠️ Houve um{' '}
										<span className="text-danger font-bold">
											erro
										</span>{' '}
										ao obter a lista de projetos. <br />
										<b>Tente novamente</b> mais tarde.
									</p>
								) : vl.length === 0 ? (
									<div className="flex-col gap-2 max-w-[400px]">
										<p className="text-[20px]">
											Nenhum projeto encontrado 😕
										</p>
										<small>
											A API usada para buscar os projetos
											está hosteada em um serviço
											gratuito, logo pode ser um pouco
											lenta as vezes, tente esperar até 10
											segundos.
										</small>
									</div>
								) : (
									vl
										.sort((a, b) =>
											a.marked ||
											b.marked ||
											a.preview_image ||
											b.preview_image ||
											a.embbed_video ||
											b.embbed_video
												? 1
												: 0,
										)
										.slice(
											0,
											size[0] < 600 && size[1] < 600
												? 2
												: 3,
										)
										.map((repo) => (
											<Card className="lg:w-[300px] max-lg:w-[200px] aspect-square">
												<CardBody>
													{repo.embbed_video ? (
														<iframe
															className="rounded-[12px]"
															src={
																repo.embbed_video
															}
															title={`${repo.name} project preview`}
															allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
														></iframe>
													) : repo.preview_image ? (
														<Image
															title={repo.name}
															src={
																repo.preview_image
															}
														/>
													) : (
														<div></div>
													)}
												</CardBody>
											</Card>
										))
								)}
							</CardBody>
						</Card>
					</main>
				);
			}}
		/>
	);
});

export default ProjectsSection;
