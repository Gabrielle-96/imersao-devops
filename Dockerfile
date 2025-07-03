# 1. Base Image: Use a slim and stable Python image.
FROM python:3.11-alpine

# 3. Set Working Directory
WORKDIR /app

# 4. Install Dependencies (leverages Docker cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy Application Code
COPY . .

# 6. Expose Port for the application
EXPOSE 8000

# 7. Run Application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]