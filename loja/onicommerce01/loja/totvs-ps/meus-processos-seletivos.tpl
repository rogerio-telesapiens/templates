<div class="container-fluid">
  <div class="row">
      <div class="card">
        <div class="card-header">
          <div class="d-flex justify-content-between align-items-center mb-20">
            <h5 class="card-title mb-0">Meus Processos Seletivos</h5>
          </div>
        </div>

        <div class="card-body">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Data</th>
                  <th>Área de Interesse</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$LISTA_PROCESSOS item=$LIS}
                  <tr>
                    <td>{$LIS.ID}</td>
                    <td>{$LIS.DATA}</td>
                    <td>{$LIS.AREA}</td>
                    <td>
                      {if $LIS.STATUS_ID eq '1'}
                        {$LIS.STATUS_DESC}
                      {/if}
                      {if $LIS.STATUS_ID eq '2'}
                        <a class="btn btn-primary" href="{$GET_SITE_HOME}loja/totvs-ps/add-carrinho/{$LIS.HASH}">Efetivar Matrícula</a>
                      {/if}
                      {if $LIS.STATUS_ID eq '3' or $LIS.STATUS_ID eq '4' or $LIS.STATUS_ID eq '5'}
                        <a class="btn btn-success" href="{$GET_SITE_HOME}detalhes-pedido/{$LIS.HASH}">Detalhes</a>
                      {/if}
                    </td>
                  </tr>
                {/foreach}
              </tbody>
            </table>
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