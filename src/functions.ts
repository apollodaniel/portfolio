import { IRepository, Repository } from './types';

async function get_user_repositories(): Promise<IRepository[]> {
	const response = await fetch(
		'https://github-scraper-api.onrender.com/api/repositories?q=apollodaniel',
	);

	if (response.status === 200) {
		return await response.json();
	}

	throw new Error('could not get projects');
}

export async function get_repositories(): Promise<Repository[]> {
	const repositories = await get_user_repositories();
	return repositories.map((r) => new Repository(r));
}

export const get_youtube_embbed_url = (video_url: string) =>
	`<iframe width="560" height="315" src="${video_url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>`;
