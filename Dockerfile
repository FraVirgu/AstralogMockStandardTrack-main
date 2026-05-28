FROM python:3.11

RUN apt-get update && apt-get install -y \
    cmake \
    build-essential

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p results

CMD ["python3", "-m", "src.astralog_mock", "--rules", "/usr/src/app/input/rules.json", "--input", "/usr/src/app/input/telemetry_cleaned.csv", "--output", "/usr/src/app/results"]