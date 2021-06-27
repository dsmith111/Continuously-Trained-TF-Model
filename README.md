# Tensorflow Serving Model

In this project, I aim to create a simple stock-prediction model which will be callable from an api and will be regularly and automatically trained on new data.

## Status

- [x] Trained
- [x] Containerized through Docker
- [x] Deployed to Heroku
- [x] Makes predictions through API
- [ ] Automatically trains on new data

## Issues

Data isn't preprocessed before passed through to model. Will be adding a Python script to process the data and make an inference call to the API.
