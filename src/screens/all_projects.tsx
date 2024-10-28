import { Card, CardBody, CardHeader, Image } from '@nextui-org/react';
import { RepositoriesContext } from '../App';
import { ProjectListSkeleton, sortRepos } from '../components/projects';
import { Repository } from '../types';
import { useEffect } from 'react';

export default function AllProjects() {
	return (
		<RepositoriesContext.Consumer>
			{(repos) => {
				console.log('rendering');
				return (
					<div className="w-full flex flex-row justify-center max-h-full">
						<Card className="bg-background/60 max-w-[90vw] pb-3">
							<CardHeader>
								<h1 className="text-[24px] lg:text-[28px] text-center">
									Todos os projetos 💻
								</h1>
							</CardHeader>
							<CardBody className="flex flex-row flex-wrap items-start justify-center gap-5 ">
								{!repos ? (
									<p className="font-small">
										⚠️ Houve um{' '}
										<span className="text-danger font-bold">
											erro
										</span>{' '}
										ao obter a lista de projetos. <br />
										<b>Tente novamente</b> mais tarde.
									</p>
								) : repos.length === 0 ? (
									<ProjectListSkeleton count={37} />
								) : (
									repos
										?.sort(sortRepos)
										.map((repo) => (
											<ProjectWrapper repo={repo} />
										))
								)}
							</CardBody>
						</Card>
					</div>
				);
			}}
		</RepositoriesContext.Consumer>
	);
}

export function ProjectWrapper({ repo }: { repo: Repository }) {
	let previewElement;

	if (repo.embbed_video) {
		previewElement = (
			<iframe
				loading="lazy"
				className="w-full aspect-video rounded-b-[0px]"
				src={repo.embbed_video}
				title={`${repo.name} project preview`}
				allow="fullscreen; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
				width="100%"
				height="100%"
			></iframe>
		);
	} else if (repo.preview_image) {
		previewElement = (
			<Image
				loading="lazy"
				className="w-full aspect-video rounded-[0px] object-cover"
				title={repo.name}
				src={repo.preview_image}
				width="100%"
				height="100%"
			/>
		);
	}

	return (
		<Card
			isPressable
			isHoverable
			isBlurred
			onPress={() => {
				window.open(repo.url);
			}}
			className="lg:w-[300px] max-lg:w-[200px] max-sm:w-full bg-background/80 border-[rgba(255,255,255,0.1)] border-[1px]"
		>
			<CardBody className="p-0">
				{previewElement}
				<div className="p-2">
					<h3 className="text-[22px] max-lg:text-[16px] font-bold truncate">
						{repo.name}
					</h3>
					<p
						className={`max-lg:text-[12px] ${previewElement ? 'truncate' : ''}`}
					>
						{repo.description}
					</p>
				</div>
			</CardBody>
		</Card>
	);
}
