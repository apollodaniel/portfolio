// main.tsx or main.jsx
import React from 'react';
import ReactDOM, { createRoot } from 'react-dom/client';
import { NextUIProvider } from '@nextui-org/react';
import App from './App';
import './index.css';
import { ThemeProvider } from 'next-themes';

createRoot(document.getElementById('root')!).render(
	<NextUIProvider>
		<ThemeProvider defaultTheme="dark">
			<App />
		</ThemeProvider>
	</NextUIProvider>,
);
