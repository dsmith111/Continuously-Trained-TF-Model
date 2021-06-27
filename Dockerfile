FROM tensorflow/serving

WORKDIR /app

COPY . .

ENV PORT=8501

# Fix because base tf_serving_entrypoint.sh does not take $PORT env variable while $PORT is set by Heroku
# CMD is required to run on Heroku

ENTRYPOINT []

ENV MODEL_BASE_PATH=/app/saved_models

ENV MODEL_NAME=stock_predictor

RUN echo '#!/bin/bash \n\n\
    tensorflow_model_server  --rest_api_port=$PORT \
    --model_name=${MODEL_NAME} --model_base_path=${MODEL_BASE_PATH}/${MODEL_NAME} \
    "$@"' > /usr/bin/tf_serving_entrypoint.sh \
    && chmod +x /usr/bin/tf_serving_entrypoint.sh
# CMD is required to run on Heroku

CMD ["/usr/bin/tf_serving_entrypoint.sh"]