import {
	createContext,
	MutableRefObject,
	useEffect,
	useRef,
	useState,
} from 'react';
import AboutMeSection from './components/about_me';
import PresentationSection from './components/presentation';
import {
	Button,
	Navbar,
	NavbarContent,
	NavbarItem,
	NavbarMenuToggle,
	Link,
	NavbarMenu,
	NavbarMenuItem,
	Dropdown,
	DropdownTrigger,
	DropdownMenu,
	DropdownItem,
	Accordion,
	AccordionItem,
} from '@nextui-org/react';
import { Outlet, useLocation, useNavigate } from 'react-router-dom';
import ProjectsSection from './components/projects';
import { Repository } from './types';
import { get_repositories } from './functions';
import ContactSection from './components/contact';

import { faAngleDown as ArrowIcon } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

export const RepositoriesContext = createContext<Repository[] | undefined>([]);

function App() {
	const [showGoTop, setShowGoTop] = useState(false);

	const [repositories, setRepositories] = useState<Repository[] | undefined>(
		[],
	);

	const presentationSectionRef = useRef<HTMLElement>();
	const aboutMeSectionRef = useRef<HTMLElement>();
	const contactSectionRef = useRef<HTMLElement>();
	const projectsSectionRef = useRef<HTMLElement>();

	const navigateScroll = useRef((path: string) => {
		switch (path) {
			// order presentation - about-me  - projects
			case '/about-me':
				aboutMeSectionRef.current?.scrollIntoView({
					behavior: 'smooth',
				});
				break;
			case '/projects':
				projectsSectionRef.current?.scrollIntoView({
					behavior: 'smooth',
				});
				break;
			case '/contact':
				contactSectionRef.current?.scrollIntoView({
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

	const getRepositories = useRef(async () => {
		try {
			const repository_list = await get_repositories();

			setRepositories(repository_list);
			window.sessionStorage.setItem(
				'repositories',
				JSON.stringify(repository_list),
			);
		} catch (err) {
			setRepositories(undefined);
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

		const cached_repos = window.sessionStorage.getItem('repositories');
		if (!cached_repos) {
			getRepositories.current();
		} else {
			setRepositories(JSON.parse(cached_repos));
		}
	}, []);

	useEffect(() => {
		if (window.location.pathname === '/projects') {
			projectsSectionRef.current?.scrollIntoView({ behavior: 'smooth' });
		}
		console.log(repositories);
	}, [repositories]);

	const [isMenuOpen, setIsMenuOpen] = useState(false);

	const menuItems = [
		{ name: 'Home', path: '/' },
		{ name: 'About me', path: '/about-me' },
		{
			name: 'Projects',
			path: '/projects',
			children: [
				{
					name: 'All projects',
					path: '/projects/all',
				},
			],
		},
		{ name: 'Contact', path: '/contact' },
	];

	const navigate = useNavigate();
	const location = useLocation();

	useEffect(() => {
		navigateScroll.current(location.pathname);
	}, [location]);

	return (
		<RepositoriesContext.Provider value={repositories}>
			{/*
				 (<PresentationSection/>)


				*/}
			<Navbar isMenuOpen={isMenuOpen} onMenuOpenChange={setIsMenuOpen}>
				<NavbarContent>
					<NavbarMenuToggle
						aria-label={isMenuOpen ? 'Close menu' : 'Open menu'}
						className="sm:hidden"
					/>
				</NavbarContent>

				<NavbarContent
					className="hidden sm:flex gap-4"
					justify="center"
				>
					{menuItems.map((item) =>
						item.children && item.children.length > 0 ? (
							<Dropdown>
								<NavbarItem>
									<DropdownTrigger className="cursor-pointer">
										<Link
											className="cursor-pointer"
											color={
												location.pathname.includes(
													item.path,
												)
													? 'primary'
													: 'foreground'
											}
										>
											{location.pathname.includes(
												'/projects',
											)
												? item.children.find(
														(child) =>
															child.path ===
															location.pathname,
													)?.name || 'Projects'
												: 'Projects'}
											<FontAwesomeIcon
												className="ms-1"
												icon={ArrowIcon}
											/>
										</Link>
									</DropdownTrigger>
								</NavbarItem>
								<DropdownMenu>
									{[item, ...item.children].map((child) => (
										<DropdownItem>
											<Link
												className="cursor-pointer"
												color={
													location.pathname ===
													child.path
														? 'primary'
														: 'foreground'
												}
												onClick={() => {
													navigate(child.path);
												}}
											>
												{child.name}
											</Link>
										</DropdownItem>
									))}
								</DropdownMenu>
							</Dropdown>
						) : (
							<NavbarItem>
								<Link
									className="cursor-pointer"
									color={
										location.pathname === item.path
											? 'primary'
											: 'foreground'
									}
									onClick={() => {
										navigate(item.path);
									}}
								>
									{item.name}
								</Link>
							</NavbarItem>
						),
					)}
				</NavbarContent>
				<NavbarMenu>
					{menuItems.map((item, index) =>
						item.children && item.children.length > 0 ? (
							<Accordion className="m-0 p-0 " isCompact>
								<AccordionItem
									className="flex flex-col items-start justify-content-start m-0 p-0"
									title={
										<Link
											className="w-full cursor-pointer pointer-events-none"
											size="lg"
											color={
												location.pathname.includes(
													item.path,
												)
													? 'primary'
													: 'foreground'
											}
										>
											{location.pathname.includes(
												'/projects',
											)
												? item.children.find(
														(child) =>
															child.path ===
															location.pathname,
													)?.name || 'Projects'
												: 'Projects'}
										</Link>
									}
								>
									{[item, ...item.children].map((child) => (
										<Link
											className="w-full cursor-pointer"
											onClick={() => {
												navigate(child.path);
												setIsMenuOpen(false);
											}}
											size="lg"
											color={
												location.pathname === child.path
													? 'primary'
													: 'foreground'
											}
										>
											{child.name}
										</Link>
									))}
								</AccordionItem>
							</Accordion>
						) : (
							<NavbarMenuItem key={`${item.name}-${index}`}>
								<Link
									className="w-full cursor-pointer"
									onClick={() => {
										navigate(item.path);
										setIsMenuOpen(false);
									}}
									size="lg"
									color={
										location.pathname === item.path
											? 'primary'
											: 'foreground'
									}
								>
									{item.name}
								</Link>
							</NavbarMenuItem>
						),
					)}
				</NavbarMenu>
			</Navbar>
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
					<ProjectsSection
						ref={
							projectsSectionRef as MutableRefObject<HTMLElement>
						}
					/>
					<ContactSection
						ref={contactSectionRef as MutableRefObject<HTMLElement>}
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
		</RepositoriesContext.Provider>
	);
}

export default App;
