# 1. Base Image - לוקחים Python מותקן מראש
FROM python:3.11-slim

# 2. הגדרת תקיית עבודה בתוך הקונטיינר
WORKDIR /app

# 3. העתקת קובץ התלויות
COPY requirements.txt .

# 4. התקנת התלויות (ספריות Python)
RUN pip install --no-cache-dir -r requirements.txt

# 5. העתקת שאר קבצי האפליקציה
COPY . .

# 6. חשיפת הפורט שהאפליקציה תרוץ עליו
EXPOSE 8000

# 7. פקודת ההפעלה של האפליקציה
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
