FROM python:3.9-slim

# System dependencies
RUN pip install "poetry==1.1.8"

# working directory inside Docker container
WORKDIR /code

# copy application dependencies
COPY poetry.lock pyproject.toml /code/

# project initialization
RUN poetry config virtualenvs.create false \
    && poetry install --no-dev

# copy code into working directory
COPY . /code

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]