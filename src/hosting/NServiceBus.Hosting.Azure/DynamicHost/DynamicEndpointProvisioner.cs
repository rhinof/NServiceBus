using System.Collections.Generic;
using System.IO;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace NServiceBus.Hosting
{
    internal class DynamicEndpointProvisioner
    {
        public IEnumerable<ServiceToRun> Provision(IEnumerable<EndpointToHost> toHost)
        {
            var localResource = RoleEnvironment.GetLocalResource("endpoints");

            foreach (var assemblies in toHost)
            {
                assemblies.ExtractTo(localResource.RootPath);

                yield return new ServiceToRun
                                 {
                                     EntryPoint = Path.Combine(localResource.RootPath, assemblies.EndpointName, "NServiceBus.Hosting.Azure.HostProcess.exe"),
                                     ServiceName = assemblies.EndpointName
                                 };
            }
            
        }
    }
}