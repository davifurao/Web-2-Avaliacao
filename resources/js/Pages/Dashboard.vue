<script setup>
import PrimaryButton from "@/Components/PrimaryButton.vue";
import TextInput from "@/Components/TextInput.vue";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout.vue";
import EmailLogo from "@/Components/EmailLogo.vue"
import EnderecoLogo from "@/Components/EnderecoLogo.vue";
import TelefoneLogo from "@/Components/TelefoneLogo.vue"
import { Head, Link, useForm } from "@inertiajs/vue3";
import { ref } from "vue";

defineProps({
    contatos: {},
});

const showForm = ref(false);

const form = useForm({
    contato: "",
    telefone: "",
    email: "",
    endereco: "",
});

const addContato = () => {
    form.post(route("contato.store"), {
        onFinish: () => {
            form.contato = "";
            form.telefone = "";
            form.email = "";
            form.endereco = "";
        },
    });
};

const removeContato = (id) => {
    if (!confirm("tem certeza que deseja apagar o contato? Seu miserável"))
        return;
    useForm({}).delete(route("contato.destroy", id), {
        onFinish: () => {
            alert("finish meu brother, removido com sucesso");
        },
    });
};
</script>

<template class="bg-neutral-300">
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Dashboard dos contatos
            </h2>
        </template>

        <div class="flex flex-col">
            <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
                    <div>
                        <div class="text-blue-100">Olha só a agenda, não para o texto, eu nunca estive aqui hehe</div>
                        <table class="table-auto">
                            <thead class = "border-b">
                            <tr>
                               
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">Contato</th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left"><TelefoneLogo class="w-10  text-gray-800 object-contain h-8 w-6"/></th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left"><EmailLogo class="w-10  text-gray-800 object-contain h-8 w-6"/></th>
                                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left"><EnderecoLogo class="w-10  text-gray-800 object-contain h-8 w-6"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="contato of contatos" :key="contato.id">
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ contato.contato }}</td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ contato.telefone }}</td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ contato.email }}</td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ contato.endereco }}</td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                    <button class="p-2 w-50 rounded-lg bg-red-400" @click="removeContato(contato.id)">
                                        Remover
                                    </button>
                                </td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap"></td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap"></td>
                                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                                    <Link class="p-2 w-50 rounded-lg bg-blue-400" :href=" route('contato.edit', contato.id) ">Editar</Link                                   >
                                </td>
                            </tr>
                        </tbody>
                        </table>

                        <button
                            class="w-64 bg-green-400 p-4 rounded-lg"
                            @click="showForm = !showForm"
                            v-if="!showForm"
                        >
                            Adicionar
                        </button>

                        <form
                            v-if="showForm"
                            @submit.prevent="addContato"
                            class="border p-2"
                        >
                            <div
                                @click="showForm = !showForm"
                                class="cursor-pointer"
                            >
                                x
                            </div>
                            <div class="grid grid-cols-2">
                                <label>Contato</label>
                                <TextInput
                                    class="border p-2"
                                    v-model="form.contato"
                                />
                            </div>
                            <div class="grid grid-cols-2">
                                <label>Telefone</label>
                                <TextInput
                                    class="border p-2"
                                    v-model="form.telefone"
                                />
                            </div>
                            <div class="grid grid-cols-2">
                                <label>Email</label>
                                <TextInput
                                    class="border p-2"
                                    v-model="form.email"
                                />
                            </div>
                            <div class="grid grid-cols-2">
                                <label>Endereço</label>
                                <TextInput
                                    class="border p-2"
                                    v-model="form.endereco"
                                />
                            </div>
                            <PrimaryButton type="submit">Enviar</PrimaryButton>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
