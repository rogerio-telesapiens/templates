<div class="container-fluid">
  <div class="row">
      <div class="card">
        <div class="card-header">
          <div class="d-flex justify-content-between align-items-center mb-20">
            <h5 class="card-title mb-0">Documentos para Matrícula</h5>
            <h6 class="card-title mb-0">Pedido #{$DADOS_PEDIDO.LOJA} - {$DADOS_PEDIDO.DATA}</h6>
          </div>
        </div>

        <div class="card-body">

          <div class="row">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th>Curso</th>
                    <th>Quantidade</th>
                    <th>Valor</th>
                  </tr>
                </thead>
                <tbody>
                  {foreach from=$LISTA_CURSOS item=$LIS}
                    <tr>
                      <td>{$LIS.CURSO}</td>
                      <td>{$LIS.QUANTIDADE}</td>
                      <td>{$LIS.VALOR}</td>
                    </tr>
                  {/foreach}
                </tbody>
              </table>
            </div>
          </div>
          <div class="row">
        <form enctype="multipart/form-data" method="post" action="{$GET_SITE_HOME}loja/totvs-ps/gravar-documentos">
          <input type="hidden" name="TOKEN_TELA" value="{$TOKEN_TELA}">
          <input type="hidden" name="ID" value="{$DADOS_PROCESSO.TOKEN_INSCRICAO}">
          <div class="card-body">
            {foreach $DADOS_PROCESSO.DOCUMENTOS AS $DOCUMENTO}
              <div class="row">
                <div class="col-12">
                  <div class="mb-3">
                    <label class="form-label">{$DOCUMENTO.NOME}: {$DOCUMENTO.DESCRICAO}</label>
                    {if $DOCUMENTO.STATUS_ID eq '4'}
                      <input type="file" name="doc_filDocumento_{$DOCUMENTO.HASH}" class="form-control">
                    {/if}
                    {if $DOCUMENTO.STATUS_ID eq '3'}
                       <label class="form-label">DOCUMENTO RECUSADO: {$DOCUMENTO.DOCUMENTO_RECUSADO}</label>
                      <input type="file" name="doc_filDocumento_{$DOCUMENTO.HASH}" class="form-control">
                    {/if}
                    {if $DOCUMENTO.STATUS_ID eq '1' or $DOCUMENTO.STATUS_ID eq '2'}
                      <h6>{$DOCUMENTO.STATUS_NOME}</h6>
                    {/if}
                  </div>
                </div>
              </div>
            {/foreach}
          </div>
          <div class="card-footer text-end">
            <button class="btn btn-primary" type="submit">Gravar</button>
            <a class="btn btn-light" href="{$GET_SITE_HOME}admin/ps-totvs/listar">Voltar para a lista</a>
          </div>
        </form>
    </div>
        </div>
      </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
  {literal}
    $(document).ready(function() {
      $('#basic-1').DataTable({
        "language": {
            "url": window.location.origin+"/view/template/assets/json/pt-br.json"
        }
      });
 
    });
      {/literal}
</script>
<div class="container-fluid">
  
</div>