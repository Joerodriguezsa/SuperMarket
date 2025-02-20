import React, { useState } from 'react';
import axios from 'axios';
import { TextField, Button, Container, Typography } from '@mui/material';

interface LoginProps {
    setIsAuthenticated: (isAuthenticated: boolean) => void;
}

const Login: React.FC<LoginProps> = ({ setIsAuthenticated }) => {
    const [usuarioLogin, setUsuarioLogin] = useState('');
    const [contrasena, setContrasena] = useState('');

    const handleLogin = async () => {
        try {
            const response = await axios.post('/api/Auth/Login', { usuarioLogin, contrasena });
            localStorage.setItem('token', response.data.token);
            setIsAuthenticated(true);
        } catch (error) {
            console.error('Error logging in:', error);
        }
    };

    return (
        <Container maxWidth="sm">
            <Typography variant="h4" component="h1" gutterBottom>
                Login
            </Typography>
            <TextField
                label="Usuario"
                variant="outlined"
                fullWidth
                margin="normal"
                value={usuarioLogin}
                onChange={(e) => setUsuarioLogin(e.target.value)}
            />
            <TextField
                label="Contraseña"
                type="password"
                variant="outlined"
                fullWidth
                margin="normal"
                value={contrasena}
                onChange={(e) => setContrasena(e.target.value)}
            />
            <Button variant="contained" color="primary" fullWidth onClick={handleLogin}>
                Login
            </Button>
        </Container>
    );
};

export default Login;