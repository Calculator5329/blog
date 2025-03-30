+++
title = "ArXiv Dashboard"
date = 2025-03-30
+++

## Overview

I created this project to explore a better way of staying up to date with AI/ML arXiv papers. I wanted a system that could automatically rank and fetch top research papers, generate high-quality summaries using an LLM, and let me ask questions about the content I didn’t fully understand. It was also a great excuse to experiment with Retrieval-Augmented Generation and make my own chatbot interface.

## Current Deployment

[**Source Code**](https://github.com/Calculator5329/ai-papers) • [**Live Demo**](https://calculator5329.github.io/ai-papers/)

- The backend is built with **FastAPI** and deployed on a **Raspberry Pi** using a persistent **Cloudflare Tunnel**.
- The frontend is a simple **React** interface, hosted on Github Pages.

---

## First Try: Google Cloud Run + SQLite

I initially deployed the app on **Google Cloud Run**, aiming to keep things simple by bundling a local SQLite database with the container. The backend used FastAPI, and Google Cloud Scheduler was set up to regularly trigger the data ingestion route for new arXiv papers. Summarization and Q&A were powered by the Gemini API.

The idea was that the scheduler would update the database on a daily basis within the Cloud Run. But since Cloud Run containers are ephemeral, each deployment or scale-up spins up a fresh container instance based on the original image. So while the scheduler ran and appeared to write to the database, those changes were lost the moment the container restarted or scaled down.

To make things worse, I had Cloud Run configured as fully serverless (anything else is prohibitively expensive), meaning it would automatically scale to zero instances when idle, effectivelly rendering my database updates obselete. I considered switching to Cloud SQL (PostgreSQL) to fix the persistence problem, but the pricing was way too high for just a personal project.

---

## Plan B: Raspberry Pi + SQLite + Cron + Cloudflare

After running into limitations with Cloud Run, I moved the entire project off the cloud and onto a Raspberry Pi Zero 2 W. It’s lightweight, always-on, and completely under my control — perfect for a project like this.

I set up a cron job on the Pi to periodically fetch new arXiv papers, generate embeddings, and update a local SQLite database. Instead of using a paid cloud database or exposing the Pi directly to the internet, I configured a persistent Cloudflare Tunnel with a custom domain, allowing the app to be securely accessed from anywhere.

---

## What’s Next

- Let users submit their own PDFs to read summaries and chat with them
- Add options for papers from other fields

---

## What I learned

- Implemented Retrieval-Augmented Generation for the first time!
- Prompt engineering and formatting LLM output in markdown
- Learned how to use the arXiv API (its suprisingly easy)
- Set up a Raspberry Pi for self-hosting and configured everything over SSH
- Google Cloud SQL has insane pricing
