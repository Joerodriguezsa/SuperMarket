import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { Container, Typography, List, ListItem, ListItemText, Box } from '@mui/material';

interface Usuario {
    usuarioID: number;
    nombre: string;
}

const Users: React.FC = () => {
    const [usuarios, setUsuarios] = useState<Usuario[]>([]);

    useEffect(() => {
        const fetchUsuarios = async () => {
            try {
                const token = localStorage.getItem('token');
                const response = await axios.get('/api/usuario', {
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                });
                setUsuarios(response.data);
            } catch (error) {
                console.error('Error al obtener los usuarios', error);
            }
        };

        fetchUsuarios();
    }, []);

    return (
        <Container maxWidth="sm">
            <Box sx={{ mt: 5 }}>
                <Typography variant="h4" component="h1" gutterBottom>
                    Usuarios Registrados
                </Typography>
                <List>
                    {usuarios.map((usuario) => (
                        <ListItem key={usuario.usuarioID}>
                            <ListItemText primary={usuario.nombre} />
                        </ListItem>
                    ))}
                </List>
            </Box>
        </Container>
    );
};

export default Users;