import React from "react";
import FacebookIcon from "@mui/icons-material/Facebook";
import InstagramIcon from "@mui/icons-material/Instagram";
import TwitterIcon from "@mui/icons-material/Twitter";
import "./Footer.css";
import { Container, Grid, Typography } from "@mui/material";
import Box from "@mui/material/Box";

/**
 * Componente que muestra el footer de la tienda
 */
function Footer() {
  return (
    <Box component="div" className="app_footer">
      <Grid container alignItems="center" sx={{ pl: 10, pr: 10 }}>
        <Grid item={true} container xs={3}>
          <Grid item={true} xs={12}>
            <Typography component="div" className="title_footer">
              Conócenos
            </Typography>
          </Grid>
          <Grid item container direction="column">
            <Grid item>
              <Typography component="div" className="link_footer">
                Trabaja en The Fashion Room
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Blog
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Acerca de The Fashion Room
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item={true} container xs={3}>
          <Grid item={true} xs={12}>
            <Typography component="div" className="title_footer">
              Gana dinero con nosotros
            </Typography>
          </Grid>
          <Grid item container direction="column">
            <Grid item>
              <Typography component="div" className="link_footer">
                Vender productos en The Fashion Room
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Vender en The Fashion Room business
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Programa de afiliados
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item={true} container xs={3}>
          <Grid item={true} xs={12}>
            <Typography component="div" className="title_footer">
              Productos de pago
            </Typography>
          </Grid>
          <Grid item container direction="column">
            <Grid item>
              <Typography component="div" className="link_footer">
                Compra con puntos
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Recarga tu saldo
              </Typography>
            </Grid>
            <Grid item>
              <Typography component="div" className="link_footer">
                Conversor de divisas de The Fashion Room
              </Typography>
            </Grid>
          </Grid>
        </Grid>
        <Grid item={true} container xs={3}>
          <Grid item={true} xs={12}>
            <Typography component="div" className="title_footer">
              Redes sociales
            </Typography>
          </Grid>
          <Grid item container direction="column">
            <Grid item>
              <Typography component="div" className="link_footer">
                Síguenos en
              </Typography>
            </Grid>
            <Grid item container spacing={2} justifyContent="center" pt={2}>
              <Grid item>
                <FacebookIcon />
              </Grid>
              <Grid item>
                <InstagramIcon />
              </Grid>
              <Grid item>
                <TwitterIcon />
              </Grid>
            </Grid>
          </Grid>
        </Grid>
      </Grid>
    </Box>
  );
}

export default Footer;
