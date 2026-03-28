# AI Body Measurements — Computer Vision Web App

**Role:** Fullstack Developer
**Date:** Jan 2025

---

## Overview

A web application that estimates key human body measurements from uploaded front and side photographs. Using pose detection models and geometric estimation techniques, the system identifies body landmarks, scales measurements based on user-provided height, and calculates values such as shoulder width, chest, waist, hips, arm length, and inseam.

The interface allows users to upload images and view visual overlays of detected pose landmarks alongside computed measurements. Incorporating both front and side views improves estimation of body proportions compared to single-image approaches.

## Use Cases

The application is designed for general sizing guidance, virtual fitting experimentation, and exploratory body analysis. Measurements are approximate and can be influenced by clothing, posture, camera angle, and image quality. Circumference values in particular are estimated using geometric assumptions rather than direct physical measurement.

## Technical Approach

I experimented with several pose estimation models — including **MediaPipe** and **YOLO** — evaluating their accuracy in landmark detection. The main challenge is that body measurements are inherently 3D, while photos are 2D. To improve depth estimation, I explored combining front and side views, SMPL body models, and monocular depth estimation. Each approach improved results incrementally but revealed the fundamental limits of single-camera 3D reconstruction for this use case.
