<header class="header">
        <div role="navigation" class="navbar navbar-default navbar-fixed-top navbar-expand-lg">
          <div class="container">
            <div class="navbar-header">
                <a href="/" class="navbar-brand scroll-to">
                    <img src="{{ asset('assets/img/rax.png') }}" alt="logo" class="hidden-xs hidden-sm" width="50">
                    <img src="{{ asset('assets/img/rax.png') }}" alt="logo" class="visible-xs visible-sm" width="50">
                    <span class="sr-only">Go to homepage</span>
                </a>
              <div class="navbar-buttons">
                <button type="button" data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle navbar-btn">Menu<i class="pe-7s-menu"></i>
                </button>
              </div>
            </div>
            <div id="navigation" class="collapse navbar-collapse navbar-right">
              <ul class="nav navbar-nav">
                {{ menu('menu_nav', 'bootstrap') }}
              </ul>
            </div>
          </div>
        </div>
      </header>
      