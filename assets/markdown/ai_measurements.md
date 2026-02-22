## Project Summary

This project is a computer vision web application that estimates key human body measurements from uploaded front and side photographs. Using pose detection models and geometric estimation techniques, the system identifies body landmarks, scales measurements based on user-provided height, and calculates values such as shoulder width, chest, waist, hips, arm length, and inseam.

The interface allows users to upload images and view visual overlays of detected pose points along with computed measurements. By incorporating both front and side views, the system improves estimation of body proportions compared to single-image approaches.

The application is designed for general sizing guidance, virtual fitting experimentation, and exploratory body analysis. Measurements are approximate and can be influenced by factors such as clothing, posture, camera perspective, and image quality. Circumference values in particular are estimated using geometric assumptions and may not reflect exact physical measurements.

I experimented with a few position estimation models like mediapipe and yolo. Overall it is hard to say which one is better since they all getting the points somewhat correctly. The problem is how to convert those into meaningful results since measurements are 3D. I tried adding additional side pictures for estimates, smpl, depth estimation models but none of them produced results that are accurate enough where we can use them reliably in practice