import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate } from 'react-router-dom';
import Menu from '../components/Menu';
import Productos from '../components/Productos';
import Usuarios from '../src/pages/Users';
import Login from '../src/pages/Login';

const App: React.FC = () => {
    const [isAuthenticated, setIsAuthenticated] = useState(false);

    useEffect(() => {
        // Verificar si el usuario está autenticado
        const token = localStorage.getItem('token');
        if (token) {
            setIsAuthenticated(true);
        }
    }, []);

    return (
        <Router>
            <div>
                {isAuthenticated ? (
                    <>
                        <Menu />
                        <Routes>
                            <Route path="/usuarios" element={<Usuarios />} />
                            <Route path="/productos" element={<Productos />} />
                            <Route path="*" element={<Navigate to="/productos" />} />
                        </Routes>
                    </>
                ) : (
                    <Routes>
                        <Route path="/login" element={<Login setIsAuthenticated={setIsAuthenticated} />} />
                        <Route path="*" element={<Navigate to="/login" />} />
                    </Routes>
                )}
            </div>
        </Router>
    );
};

export default App;
