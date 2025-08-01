import { htmlSafe } from "@ember/template";
import RouteTemplate from "ember-route-template";
import DBreadcrumbsItem from "discourse/components/d-breadcrumbs-item";
import DPageHeader from "discourse/components/d-page-header";
import DPageSubheader from "discourse/components/d-page-subheader";
import PluginOutlet from "discourse/components/plugin-outlet";
import lazyHash from "discourse/helpers/lazy-hash";
import getUrl from "discourse/lib/get-url";
import { i18n } from "discourse-i18n";
import AdminFilterControls from "admin/components/admin-filter-controls";
import ColorPaletteListItem from "admin/components/color-palette-list-item";

const FILTER_MINIMUM = 8;

export default RouteTemplate(
  <template>
    <DPageHeader @hideTabs={{true}}>
      <:breadcrumbs>
        <DBreadcrumbsItem @path="/admin" @label={{i18n "admin_title"}} />
        <DBreadcrumbsItem
          @path="/admin/customize/colors"
          @label={{i18n "admin.config.color_palettes.title"}}
        />
      </:breadcrumbs>
    </DPageHeader>

    <DPageSubheader
      @titleLabel={{i18n "admin.config.color_palettes.title"}}
      @descriptionLabel={{i18n
        "admin.config.color_palettes.header_description"
      }}
      @learnMoreUrl="https://meta.discourse.org/t/allow-users-to-select-new-color-palettes/60857"
    >
      <:actions as |actions|>
        <PluginOutlet
          @name="admin-customize-colors-new-button"
          @outletArgs={{lazyHash actions=actions controller=@controller}}
        >
          <actions.Primary
            @label="admin.customize.new"
            @action={{@controller.newColorScheme}}
            @icon="plus"
          />
        </PluginOutlet>
      </:actions>
    </DPageSubheader>

    {{#if @controller.changedThemePreferences}}
      <div class="alert alert-info">
        {{htmlSafe
          (i18n
            "admin.customize.colors.preference_warning"
            link=(getUrl "/my/preferences/interface")
          )
        }}
      </div>
    {{/if}}

    {{#unless @controller.changedThemePreferences}}
      {{! only show one alert at a time, changedThemePreferences takes precedence }}
      {{#if @controller.isUsingDarkMode}}
        <div class="alert alert-info">
          {{htmlSafe
            (i18n
              "admin.customize.colors.dark_mode_warning"
              link=(getUrl
                "/admin/site_settings/category/all_results?filter=default dark mode"
              )
            )
          }}
        </div>
      {{/if}}
    {{/unless}}

    <AdminFilterControls
      @array={{@controller.sortedColorSchemes}}
      @minItemsForFilter={{FILTER_MINIMUM}}
      @searchableProps={{@controller.searchableProps}}
      @dropdownOptions={{@controller.dropdownOptions}}
      @inputPlaceholder={{i18n
        "admin.customize.colors.filters.search_placeholder"
      }}
      @noResultsMessage={{i18n "admin.customize.colors.filters.no_results"}}
      as |schemes|
    >
      <ul class="color-palette__list">
        {{#each schemes as |scheme|}}
          <ColorPaletteListItem
            @scheme={{scheme}}
            @defaultTheme={{@controller.defaultTheme}}
            @isDefaultThemeColorScheme={{@controller.isDefaultThemeColorScheme}}
            @toggleUserSelectable={{@controller.toggleUserSelectable}}
            @setAsDefaultThemePalette={{@controller.setAsDefaultThemePalette}}
            @deleteColorScheme={{@controller.deleteColorScheme}}
          />
        {{/each}}
      </ul>
    </AdminFilterControls>
  </template>
);
