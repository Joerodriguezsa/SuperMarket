import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { TextField, Button, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper } from '@mui/material';

interface Producto {
    productoID: number;
    nombreProducto: string;
    descripcion: string;
    precioVenta: number;
    precioCompra: number;
    cantidadEnInventario: number;
    fechaVencimiento: string;
    codigoBarras: string;
    categoria: {
        nombreCategoria: string;
    };
}

const Productos: React.FC = () => {
    const [productos, setProductos] = useState<Producto[]>([]);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        fetchProductos();
    }, []);

    const fetchProductos = async () => {
        try {
            const response = await axios.get('/api/producto');
            setProductos(response.data);
        } catch (error) {
            console.error('Error fetching productos:', error);
        }
    };

    const handleSearch = async () => {
        try {
            const response = await axios.get(`/api/producto/search?searchTerm=${searchTerm}`);
            setProductos(response.data);
        } catch (error) {
            console.error('Error searching productos:', error);
        }
    };

    return (
        <div>
            <h1>Productos</h1>
            <TextField
                label="Buscar"
                variant="outlined"
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
            />
            <Button variant="contained" color="primary" onClick={handleSearch}>
                Buscar
            </Button>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>ID</TableCell>
                            <TableCell>Nombre</TableCell>
                            <TableCell>Descripción</TableCell>
                            <TableCell>Precio Venta</TableCell>
                            <TableCell>Precio Compra</TableCell>
                            <TableCell>Cantidad</TableCell>
                            <TableCell>Fecha Vencimiento</TableCell>
                            <TableCell>Código Barras</TableCell>
                            <TableCell>Categoría</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {productos.map((producto) => (
                            <TableRow key={producto.productoID}>
                                <TableCell>{producto.productoID}</TableCell>
                                <TableCell>{producto.nombreProducto}</TableCell>
                                <TableCell>{producto.descripcion}</TableCell>
                                <TableCell>{producto.precioVenta}</TableCell>
                                <TableCell>{producto.precioCompra}</TableCell>
                                <TableCell>{producto.cantidadEnInventario}</TableCell>
                                <TableCell>{new Date(producto.fechaVencimiento).toLocaleDateString()}</TableCell>
                                <TableCell>{producto.codigoBarras}</TableCell>
                                <TableCell>{producto.categoria?.nombreCategoria}</TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
        </div>
    );
};

export default Productos;