<div class="col-xl-12 col-md-12 box-col-12 xl-70">
  <div class="email-right-aside bookmark-tabcontent">
    <div class="card email-body radius-left">
      <div class="ps-0">
        <div class="tab-content">
          {if $TEM_ALERTA eq 'true'}
            <div class="tab-pane fade active show" id="pills-created" role="tabpanel" aria-labelledby="pills-created-tab">
              <div class="card mb-0">
                <div class="card-body p-0">
                  <div class="taskadd">
                    <div class="table-responsive">
                      <table class="table">
                        {foreach $LISTA_ALERTAS item=$ALERTA}
                        <tr>
                          <td>
                            <div class="alert alert-danger" role="alert">
                              <h4 class="alert-heading">{$ALERTA.TITULO}</h4>
                              <p>{$ALERTA.TEXTO}<br><i>({$ALERTA.DATA})</i></p>
                            </div>
                          </td>
                          <td class="col-2">
                            <a class="btn btn-light" href="{$GET_SITE_HOME}admin/sistema/ocultar-aviso/{$ALERTA.HASH}">Marcar como lido</a>
                          </td>
                        </tr>
                        {/foreach}
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          {/if}
          {if $TEM_NOVIDADE eq 'true'}
            <div class="tab-pane fade active show" id="pills-created" role="tabpanel" aria-labelledby="pills-created-tab">
              <div class="card mb-0">
                <div class="card-header">
                  <h5 class="mb-0">Novidades</h5>
                </div>
                <div class="card-body p-0">
                  <div class="taskadd">
                    <div class="table-responsive">
                      <table class="table">
                        {foreach $LISTA_NOVIDADES item=$NOVIDADE}
                        <tr>
                          <td>
                            <h6 class="task_title_0">{$NOVIDADE.TITULO}</h6>
                            <p class="project_name_0">{$NOVIDADE.MENU}</p>
                          </td>
                          <td>
                            <p class="task_desc_0">{$NOVIDADE.TEXTO}<br><i>({$NOVIDADE.DATA})</i></p>
                          </td>
                          <td class="col-2">
                            <a class="btn btn-light" href="{$GET_SITE_HOME}admin/sistema/ocultar-aviso/{$NOVIDADE.HASH}">Marcar como lida</a>
                          </td>
                        </tr>
                        {/foreach}
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          {/if}
        </div>
      </div>
    </div>
  </div>
</div>