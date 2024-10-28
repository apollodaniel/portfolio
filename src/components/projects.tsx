import { forwardRef, MutableRefObject, useEffect, useState } from 'react';
import { RepositoriesContext } from '../App';
import {
	Button,
	Card,
	CardBody,
	CardHeader,
	Image,
	Skeleton,
} from '@nextui-org/react';
import { get_youtube_embbed_url } from '../functions';
import { Repository } from '../types';
import { useNavigate } from 'react-router-dom';

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

	const navigate = useNavigate();

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
									onClick={() => {
										navigate('/projects/all');
									}}
								>
									Ver todos os projetos
								</Button>
							</CardHeader>
							<CardBody className=" flex-row flex-wrap items-center justify-center max-w-[80vw] max-sm:max-w-[95vw] gap-3">
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
									<ProjectListSkeleton />
								) : (
									vl
										.sort(sortRepos)
										.slice(
											0,
											size[0] < 600 && size[1] < 600
												? 2
												: 3,
										)
										.map((repo) => (
											<ProjectWrapper repo={repo} />
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

export function sortRepos(a: Repository, b: Repository): number {
	// Priority for items with `embedVideo` (highest priority)
	if (a.marked && !b.marked) return -1;
	if (!a.marked && b.marked) return 1;
	if (a.embbed_video && !b.embbed_video) return -1;
	if (!a.embbed_video && b.embbed_video) return 1;

	// Priority for items with `previewImage` (only if both lack `embbed_video`)
	if (a.preview_image && !b.preview_image) return -1;
	if (!a.preview_image && b.preview_image) return 1;

	// No sorting needed if both items have the same properties
	return b.description.length - a.description.length;
}

function ProjectWrapper({ repo }: { repo: Repository }) {
	// default is undefined
	let previewElement;

	if (repo.embbed_video) {
		previewElement = (
			<iframe
				className="w-full p-0 m-0 aspect-[16/9]"
				src={repo.embbed_video}
				title={`${repo.name} project preview`}
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			></iframe>
		);
	} else if (repo.preview_image) {
		previewElement = (
			<Image
				className="w-full p-0 m-0 object-cover aspect-[16/9] rounded-[0px]"
				title={repo.name}
				src={repo.preview_image}
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
			className="lg:w-[300px] max-lg:w-[200px] aspect-square  bg-background/80 border-[rgba(255,255,255,0.1)] border-[1px]"
		>
			<CardBody className="p-0">
				{previewElement}

				<div className="p-2">
					<h3 className="text-[22px] max-lg:text-[16px] font-bold truncate">
						{repo.name}
					</h3>
					<p className="max-lg:text-[12px] may-wrap supports-[-webkit-line-clamp]:line-clamp-2">
						{repo.description}
					</p>
				</div>
			</CardBody>
		</Card>
	);
}

export function ProjectListSkeleton({ count }: { count?: number }) {
	return Array.from(
		(function* () {
			for (let i = 0; i < (count || 3); i++) {
				yield (
					<Card
						key={i} // Add a unique key for each item
						className="lg:w-[300px] max-lg:w-[200px] aspect-square space-y-5 p-4 bg-background/80 border-[rgba(255,255,255,0.1)] border-[1px]"
						radius="lg"
					>
						<Skeleton className="rounded-lg">
							<div className="h-24 rounded-lg bg-default-300"></div>
						</Skeleton>
						<div className="space-y-3">
							<Skeleton className="w-3/5 rounded-lg">
								<div className="h-3 w-3/5 rounded-lg bg-default-200"></div>
							</Skeleton>
							<Skeleton className="w-4/5 rounded-lg">
								<div className="h-3 w-4/5 rounded-lg bg-default-200"></div>
							</Skeleton>
							<Skeleton className="w-2/5 rounded-lg">
								<div className="h-3 w-2/5 rounded-lg bg-default-300"></div>
							</Skeleton>
						</div>
					</Card>
				);
			}
		})(),
	);
}

export default ProjectsSection;
