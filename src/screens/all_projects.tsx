import { Card, CardBody, CardHeader, Image } from '@nextui-org/react';
import { OutletContextType } from '../App';
import { ProjectListSkeleton, sortRepos } from '../components/projects';
import { Repository } from '../types';
import { useOutletContext } from 'react-router-dom';

export default function AllProjects() {
	const { repositories } = useOutletContext<OutletContextType>();

	return (
		<div className="w-full flex flex-row justify-center max-h-full">
			<Card className="bg-background/60 max-w-[90vw] pb-3">
				<CardHeader>
					<h1 className="text-[24px] lg:text-[28px] text-center">
						Todos os projetos 💻
					</h1>
				</CardHeader>
				<CardBody className="flex flex-row flex-wrap items-start justify-center gap-5 ">
					{!repositories ? (
						<p className="font-small">
							⚠️ Houve um{' '}
							<span className="text-danger font-bold">erro</span>{' '}
							ao obter a lista de projetos. <br />
							<b>Tente novamente</b> mais tarde.
						</p>
					) : repositories.length === 0 ? (
						<ProjectListSkeleton count={37} />
					) : (
						repositories
							?.sort(sortRepos)
							.map((repo) => <ProjectWrapper repo={repo} />)
					)}
				</CardBody>
			</Card>
		</div>
	);
}

export function ProjectWrapper({ repo }: { repo: Repository }) {
	console.log('rendering internal');
	return (
		<Card
			isPressable
			isHoverable
			onPress={() => {
				window.open(repo.url);
			}}
			className="lg:w-[300px] max-lg:w-[200px] max-sm:w-full bg-background/80 border-[rgba(255,255,255,0.1)] border-[1px]"
		>
			<CardBody className="p-0">
				{repo.embbed_video ? (
					<iframe
						loading="lazy"
						className="w-full aspect-video rounded-b-[0px]"
						src={repo.embbed_video}
						title={`${repo.name} project preview`}
						allow="fullscreen; accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						width="100%"
						height="100%"
					></iframe>
				) : repo.preview_image ? (
					<Image
						loading="lazy"
						className="w-full aspect-video rounded-[0px] object-cover"
						title={repo.name}
						src={repo.preview_image}
						width="100%"
						height="100%"
					/>
				) : (
					<></>
				)}

				<div className="p-2">
					<h3 className="text-[22px] max-lg:text-[16px] font-bold truncate">
						{repo.name}
					</h3>
					<p
						className={`max-lg:text-[12px] ${repo.embbed_video || repo.preview_image ? 'truncate' : ''}`}
					>
						{repo.description}
					</p>
				</div>
			</CardBody>
		</Card>
	);
}
