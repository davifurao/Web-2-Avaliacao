<script setup>

import { useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

const props = defineProps({
    'contato': {}
})

const form = useForm({
    'contato': props.contato.contato,
    'telefone': props.contato.telefone,
    'email': props.contato.email,
    'endereco': props.contato.endereco
})

const updateContato = () => {
    form.patch(route('contato.update', props.contato.id), {
        onFinish: () => {
            alert('foi-fue-Gone-já era')
        }
    })
}

</script>

<template>
    <AuthenticatedLayout>
        <div>
            <h1>Edição dos contatos</h1>
            <form @submit.prevent="updateContato" class="border p-2">
               
                <div class="grid grid-cols-2">
                    <label>Contato</label>
                    <TextInput class="border p-2" v-model="form.contato" />
                </div>
                <div class="grid grid-cols-2">
                    <label>Telefone</label>
                    <TextInput class="border p-2" v-model="form.telefone" />
                </div>
                <div class="grid grid-cols-2">
                    <label>Email</label>
                    <TextInput class="border p-2" v-model="form.email" />
                </div>
                <div class="grid grid-cols-2">
                    <label>Endereço</label>
                    <TextInput class="border p-2" v-model="form.endereco" />
                </div>
                <PrimaryButton type="submit">Enviar</PrimaryButton>
            </form>
        </div>
    </AuthenticatedLayout>
</template>