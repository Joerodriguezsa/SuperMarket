import React from 'react';
import { Link } from 'react-router-dom';
import { AppBar, Toolbar, Typography, Button } from '@mui/material';

const Menu: React.FC = () => {
    return (
        <AppBar position="static">
            <Toolbar>
                <Typography variant="h6" style={{ flexGrow: 1 }}>
                    SuperMarketApp
                </Typography>
                <Button color="inherit" component={Link} to="/usuarios">
                    Usuarios
                </Button>
                <Button color="inherit" component={Link} to="/productos">
                    Productos
                </Button>
            </Toolbar>
        </AppBar>
    );
};

export default Menu;