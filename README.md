# Full-Stack Project with Django REST and Flutter

This is a full-stack project with a Django REST backend and a Flutter frontend. The project is organized into two folders: `backend` for the Django REST backend and `frontend` for the Flutter frontend.

## Project Structure

- **backend:** Contains the Django REST backend code.
- **frontend:** Contains the Flutter frontend code.

## Setup Instructions

1. **Create MySQL Database:**
   - Create an empty MySQL database for the project.

2. **Configure Environment Variables:**
   - In the `backend` folder, create a `.env` file based on the provided `.envexample` file.
   - Fill in the necessary configuration details like database settings.

3. **Migrate Database:**
   - Run the following command in the `backend` folder to apply migrations and set up the database:
     ```bash
     python manage.py migrate
     ```

4. **Create Superuser:**
   - Create a superuser for the backend by running:
     ```bash
     python manage.py createsuperuser
     ```
     Follow the prompts to set a username, email, and password.

5. **Start Backend Server:**
   - Start the Django development server by running:
     ```bash
     python manage.py runserver
     ```

6. **Start Frontend Server:**
   - Open a new terminal in the `frontend` folder and run:
     ```bash
     flutter run
     ```
     This will start the Flutter development server.

7. **Access the Project:**
   - The backend server will be running at `http://localhost:8000/`.

## Contributing

Feel free to contribute to this project by opening issues or submitting pull requests.

