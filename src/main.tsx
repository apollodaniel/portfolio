// main.tsx or main.jsx
import React from 'react';
import ReactDOM, { createRoot } from 'react-dom/client';
import { NextUIProvider } from '@nextui-org/react';
import App from './App';
import './index.css';
import { ThemeProvider } from 'next-themes';
import { createBrowserRouter, Router, RouterProvider } from 'react-router-dom';
import AllProjects from './screens/all_projects';

const router = createBrowserRouter([
	{
		path: '/',
		errorElement: (
			<NextUIProvider>
				<ThemeProvider defaultTheme="dark">
					<App />
				</ThemeProvider>
			</NextUIProvider>
		),
		element: (
			<NextUIProvider>
				<ThemeProvider defaultTheme="dark">
					<App />
				</ThemeProvider>
			</NextUIProvider>
		),
		children: [
			{
				path: '/projects/all',
				element: <AllProjects />,
			},
		],
	},
]);

createRoot(document.getElementById('root')!).render(
	<RouterProvider router={router} />,
);
