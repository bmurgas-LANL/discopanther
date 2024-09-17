#include "discopanterApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
discopanterApp::validParams()
{
  InputParameters params = MooseApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

discopanterApp::discopanterApp(InputParameters parameters) : MooseApp(parameters)
{
  discopanterApp::registerAll(_factory, _action_factory, _syntax);
}

discopanterApp::~discopanterApp() {}

void
discopanterApp::registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  ModulesApp::registerAllObjects<discopanterApp>(f, af, s);
  Registry::registerObjectsTo(f, {"discopanterApp"});
  Registry::registerActionsTo(af, {"discopanterApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
discopanterApp::registerApps()
{
  registerApp(discopanterApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
discopanterApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  discopanterApp::registerAll(f, af, s);
}
extern "C" void
discopanterApp__registerApps()
{
  discopanterApp::registerApps();
}
