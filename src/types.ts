export interface IRepository {
	name: string;
	url: string;
	main_language: string;
	description: string;
}

export class Repository {
	name: string;
	url: string;
	main_language: string;
	description: string;
	marked: boolean;
	preview_image?: string;
	embbed_video?: string;

	constructor({ name, description, main_language, url }: IRepository) {
		this.name = name;
		this.url = url;
		this.main_language = main_language;

		this.marked = description.includes('#mark');

		const match_video = description.match(/<video: .+>/);
		if (match_video) {
			this.embbed_video = match_video[0]
				.replace('<video: ', '')
				.replace('>', '');
		}

		const match_preview = description.match(/\$[a-zA-z0-9]+/);
		if (match_preview) {
			this.preview_image = match_preview[0].substring(
				1,
				match_preview[0].length,
			);
		}

		const keyword_indexes = [
			description.indexOf('<'),
			description.indexOf('$'),
			description.indexOf('#'),
		].filter((v) => v != -1);
		const _description = description.substring(
			0,
			keyword_indexes[0] || description.length,
		);

		this.description = _description;
	}
}
