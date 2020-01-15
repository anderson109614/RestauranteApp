import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { con } from '../Modelos/Configuracion';
import {FacturaMaestro} from '../Modelos/FacuraMaestro';
import {Detalle} from '../Modelos/Detalle'
@Injectable({
  providedIn: 'root'
})
export class PedidosService {

  constructor(private http:HttpClient) { }
  ip = con.ipser;
  GuardarMaestro(mae: FacturaMaestro)
  {
    return this.http.post<FacturaMaestro>(this.ip+'ServiciosApp/SerFactura/Maestro.php', mae);
  }
  GuardarDetalle(mae: Detalle)
  {
    return this.http.post<Detalle>(this.ip+'ServiciosApp/SerFactura/Detalle.php', mae);
  }
}
