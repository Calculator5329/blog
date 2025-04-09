+++
title = "Stock Portfolio Visualizer" 
date = 2025-03-28
+++

## Overview

I’ve been interested in investing since I was a kid. After winning a math competition in 2017, I wanted to manage my winnings wisely and decided to go with a proffesional to invest most of it. Unfortunately, the professional service I used charged high fees and consistently underperformed the market.

In 2020, right before COVID hit, I decided to take control of my investments and started managing them myself at 15. Since then, I’ve continued to invest, keeping a “safe” portfolio of VTI (total market index) alongside a self-managed growth portfolio.

Over time, I became frustrated with how limited most portfolio tools are, especially when it comes to backtesting. Most of the good ones are locked behind paywalls and I would much rather invest that money.

This project is my **in-progress** attempt to build what I wished existed: a clean, customizable tool for backtesting different portfolio strategies and viewing useful performance metrics.

## Current Deployment

[**Source Code**](https://github.com/Calculator5329/stock-site) • [**Live Demo**](https://cheery-tiramisu-028ceb.netlify.app/)

- The backend is a Dockerized FastAPI app, deployed as an Azure App Service.
- The frontend is built with Next.js (great for future features like login, saved portfolios, and SSR) and hosted on Netlify
- Switched from CSVs to Pickle files, mostly for the superior name, but also for the much faster load times.
- Used yfinance to get historical data, limited to S&P500 companies.

## Update 04/09/2025

- Expanded support to include all US companies with a market cap greather than 10B
- Expanded support for the top 100 ETFs in the US Market
- Added underlying performance to main chart
- Added second chart for individual stock performance and metrics

## What's Next

- Expand support to include ETFs ✔️
- Add stocks not included in the S&P 500 ✔️
- Monte Carlo Simulations
- Discounted Cash Flow tool
- Login & Saved portfolio tracking
- Stock screener with fine-tuned LLM
- Individual stock financials breakdown (An absurd amount of data)

## What I Learned

- Optimization techniques for rendering graphs and dynamic content in Next.js (hint: don't re-render complex graphs every time the page state updates)
- Frontend design basics (layout, textures, gradients, and visualizing data with graphs)
- Pickle files are the best (At least 10x more efficent than my csv files)
- Using yfinance works, but it's so picky it's often better to just download the data manually
