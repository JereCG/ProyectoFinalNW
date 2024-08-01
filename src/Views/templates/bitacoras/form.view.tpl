<section class="grid">
    <section class="row">
        <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">{{modeDsc}}</h2>
    </section>
</section>
<section class="grid">
    <section class="row my-4">
    <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Bitacoras-Bitacora&mode={{mode}}&bitacoracod={{bitacoracod}}" method="POST" >
        <input type="hidden" name="bitacoracod" value="{{bitacoracod}}">
        <input type="hidden" name="mode" value="{{mode}}">
        
        <div class="row my-4">
            <label class="col-4" for="bitacoracod">Código:</label>
            <input class="col-8" type="text" name="bitacoracod" id="bitacoracod" value="{{bitacoracod}}" required {{isReadOnly}}>
        </div>

        <div class="row my-4">
            <label class="col-4" for="bitacorafch">Fecha:</label>
            <input class="col-8" type="text" name="bitacorafch" id="bitacorafch" value="{{bitacorafch}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_dsc}}
                    {{foreach error_dsc}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_dsc}}
                {{endif error_dsc}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="bitprograma">Programa:</label>
            <input class="col-8" type="text" name="bitprograma" id="bitprograma" value="{{bitprograma}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_est}}
                    {{foreach error_est}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_est}}
                {{endif error_est}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="bitdescripcion">Descripción:</label>
            <input class="col-8" type="text" name="bitdescripcion" id="bitdescripcion" value="{{bitdescripcion}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="bitobservacion">Observación:</label>
            <input class="col-8" type="text" name="bitobservacion" id="bitobservacion" value="{{bitobservacion}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="bitTipo">Tipo:</label>
            <input class="col-8" type="text" name="bitTipo" id="bitTipo" value="{{bitTipo}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="bitusuario">Descripción:</label>
            <input class="col-8" type="text" name="bitusuario" id="bitusuario" value="{{bitusuario}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>
        <div class="row flex-end">
            {{ifnot isDisplay}}
                <button type="submit" class="primary mx-2">
                    <i class="fa-solid fa-check"></i>&nbsp;
                    Guardar
                </button>
            {{endifnot isDisplay}}
            <button type="button" onclick="window.location='index.php?page=Bitacoras-Bitacoras'">
                <i class="fa-solid fa-xmark"></i>
                Cancelar
            </button>
        </div>
    </form>
    </section>
</section>