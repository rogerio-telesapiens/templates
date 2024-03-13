<main class="bg_gray">
  <div class="container margin_30">
    <div class="page_header">
      <div class="card">
        <div class="card-header">
          <div class="d-flex justify-content-center align-items-center mb-20">
            <h4 class="card-title mt-4">Meus Pedidos</h4>
            
          </div>

        </div>
        <div class="row justify-content-md-center">
          <div class="col-md-2 ">
            <hr class="mb-0 mt-0" style="height: 2px; color: black;">
          </div>
        </div>

        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped cart-list" style="text-align: center">
              <thead>
                <tr>
                  <th></th>
                  <th>#</th>
                  <th>Data</th>
                  <th>Valor</th>
                  <th>Pagamento</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$LISTA_PEDIDOS item=$LIS}
                  <tr>
                    <td>
                      <a href="{$GET_SITE_HOME}loja/pedido/detalhes/{$LIS.HASH}" class="btn_1" role="button">Detalhes</a>
                    </td>
                    <td>{$LIS.PEDIDO_LOJA}</td>
                    <td>{$LIS.DATA}</td>
                    <td>{$LIS.VALOR}</td>
                    <td>{$LIS.MEIOPAGAMENTO}</td>
                    <td>{$LIS.STATUS}</td>
                  </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
  {literal}
    $(document).ready(function() {
      $('#basic-1').DataTable({
        "language": {
          "url": window.location.origin + "/view/template/assets/json/pt-br.json"
        }
      });

    });
  {/literal}
</script>