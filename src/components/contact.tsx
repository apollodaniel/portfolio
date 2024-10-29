import { Button, Card, CardBody, Image, Textarea } from '@nextui-org/react';
import '../style/aboutme.css';
import { forwardRef, useState } from 'react';

import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faGithub, faLinkedin } from '@fortawesome/free-brands-svg-icons';
import { faGoogle } from '@fortawesome/free-brands-svg-icons/faGoogle';

type Props = {};

const ContactSection = forwardRef<HTMLElement, Props>((props, ref) => {
	const [isInvalidMessage, setIsInvalidMessage] = useState(false);
	const [mailBody, setMailBody] = useState('');

	return (
		<main ref={ref} className="max-lg:p-24 max-md:p-16 max-sm:p-8">
			<Card
				className="border-[rgba(255,255,255,0.1)] border-[1px] bg-background/60 dark:bg-default-100/50 lg:w-[900px] lg:aspect-1/2"
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
								Vamos conversar? 😎
							</h2>
							<Textarea
								isRequired
								isInvalid={isInvalidMessage}
								label="Mensagem"
								onChange={(event) => {
									setIsInvalidMessage(false);
									setMailBody(event.target.value);
								}}
								labelPlacement="outside"
								placeholder="Me escreva uma mensagem legal :)"
								className="w-full mt-3"
								errorMessage="Me escreva uma mensagem antes de enviar :)"
							/>
							<Button
								onClick={() => {
									if (
										mailBody.replace('\n', '').trim() == ''
									) {
										setIsInvalidMessage(true);
										return;
									}
									window.open(
										`mailto:developer.apollo.mail@gmail.com?subject=Vim pelo portfólio :)&body=${mailBody}`,
									);
								}}
								color="primary"
							>
								Enviar 📩
							</Button>

							<div className="flex flex-row flex-wrap justify-center mt-4 gap-2 w-full">
								<Button
									onClick={() => {
										window.open(
											'https://github.com/apollodaniel',
										);
									}}
									variant="bordered"
								>
									Github
									<FontAwesomeIcon
										icon={faGithub}
										size="lg"
									/>
								</Button>
								<Button
									onClick={() => {
										window.open(
											`mailto:developer.apollo.mail@gmail.com?subject=Vim pelo portfólio :)`,
										);
									}}
									variant="bordered"
								>
									Email
									<FontAwesomeIcon
										icon={faGoogle}
										size="lg"
									/>
								</Button>
								<Button
									onClick={() => {
										window.open(
											'https://www.linkedin.com/in/apollo-daniel-620570233/',
										);
									}}
									variant="bordered"
								>
									Linkedin
									<FontAwesomeIcon
										icon={faLinkedin}
										size="lg"
									/>
								</Button>
							</div>
						</div>
					</div>
				</CardBody>
			</Card>
		</main>
	);
});

export default ContactSection;
